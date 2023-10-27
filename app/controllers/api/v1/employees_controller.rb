class Api::V1::EmployeesController < Api::V1::BaseController
  before_action :set_employee, only: %i[update show destroy]

  def index
    employees = current_tenant.employees.all
    employees = employees.filter_by_role(params[:role]) if params[:role].present?
    employees = employees.find_by_email(params[:email]) if params[:email].present?
    employees = employees.find_by_name(params[:name]) if params[:name].present?

    pagy, records = pagy(employees)
    pagy_headers_merge(pagy)
    render json: EmployeeSerializer.new(records).serializable_hash[:data]
  end

  def create
    @employee = current_tenant.employees.create(employee_params)

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
      @employee = current_tenant.employees.find(params[:id])
    end
end
