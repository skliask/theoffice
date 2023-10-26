class Api::V1::EmployeesController < ApplicationController
  before_action :set_tenant, only: %i[index]
  before_action :set_employee, only: %i[update show destroy]

  def index
    @employees = @tenant.employees.all
    render json: EmployeeSerializer.new(@employees).serializable_hash[:data]
  end

  def create
    @employee = Employee.create(employee_params)
    if @employee.save
      render json: EmployeeSerializer.new(@employee).serializable_hash[:data][:attributes], status: 200
    else
      render json: @employee.errors, status: 400
    end
  end

  def show
    render json: EmployeeSerializer.new(@employee).serializable_hash[:data][:attributes]
  end

  def update
    if @employee.update(employee_params)
      render json: EmployeeSerializer.new(@employee).serializable_hash[:data][:attributes], status: 200
    else
      render json: @employee.errors, status: 400
    end
  end

  def destroy
    if @employee.destroy
      render json: EmployeeSerializer.new(@employee).serializable_hash[:data][:attributes], status: 200
    else
      render json: @employee.errors, status: 400
    end
  end

  private

    def employee_params
      params.permit(:name, :role, :email, :tenant_id)
    end

    def set_employee
      @employee = Employee.find(params[:id])
    end

    def set_tenant
      @tenant = Tenant.find(params[:tenant_id])
    end
end
