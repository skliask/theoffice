RSpec.describe 'Employees', type: :request do
  let(:tenant) { create(:tenant) }
  let!(:employees) { create_list(:employee, 30, tenant_id: tenant.id) }
  let(:employee_id) { employees.first.id }

  before do
    tenant_login tenant
    @token = "Bearer #{@tokens[:access]}"
  end

  describe 'GET /employees' do
    before { get "/api/v1/employees", headers: { Authorization: @token } }

    it 'returns employees' do
      json = JSON.parse(response.body)
      expect(json).not_to be_empty
      expect(json.size).to eq(20)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'has_pagination' do
      headers = response.headers
      expect(headers["current-page"]).to eq('1')
      expect(headers["total-pages"]).to eq('2')
      expect(headers["total-count"]).to eq('30')
    end

    it "paginates" do
      get "/api/v1/employees?page=2", headers: { Authorization: @token }
      json = JSON.parse(response.body)
      expect(json.size).to eq(10)
    end
  end

  describe 'GET /employees/:id' do
    before { get "/api/v1/employees/#{employee_id}", headers: { Authorization: @token } }

    context 'when employee exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the employee item' do
        json = JSON.parse response.body
        expect(json['id']).to eq(employee_id)
      end
    end

    context 'when employee does not exist' do
      let(:employee_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find Employee with 'id'=0")
      end
    end
  end

  describe 'POST /employees/:id' do
    let!(:tenant) { create(:tenant) }

    let(:valid_attributes) do
      {
        name: 'Michael Scott',
        role: 'sales',
        email: 'michael@dd.com',
        tenant_id: tenant.id
      }
    end

    context 'when request attributes are valid' do
      before { post '/api/v1/employees', params: valid_attributes, headers: { Authorization: @token } }

      it 'returns status code 201' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when an invalid request' do
      before { post '/api/v1/employees', params: {}, headers: { Authorization: @token } }

      it 'returns status code 400' do
        expect(response).to have_http_status(400)
       end

       it 'returns a failure message' do
        expect(response.body).to include("can't be blank")
       end
      end
    end

  describe 'PUT /employees/:id' do
    let(:valid_attributes) { { name: 'Jim Halpert' } }

    before { put "/api/v1/employees/#{employee_id}", params: valid_attributes, headers: { Authorization: @token } }
    context 'when employee exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(200)
      end

      it 'updates the employee' do
        updated_item = Employee.find(employee_id)
        expect(updated_item.name).to match(/Jim Halpert/)
      end
    end

    context 'when the employee does not exist' do
      let(:employee_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find Employee with 'id'=0")
      end
    end
  end

  describe 'DELETE /employees/:id' do
    before { delete "/api/v1/employees/#{employee_id}", headers: { Authorization: @token } }
    it 'returns status code 204' do
      expect(response).to have_http_status(200)
    end
  end
end
