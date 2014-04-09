class DataManager
  def initialize(crm_data)
    @crm_data = crm_data
  end

  def employees_for_company(company_id)
    employees = Array.new
    @crm_data[:people].each do |person|
      person[:employments].each do |employment|
        if employment[:company_id] == company_id
          titled_person = {
            :id => person[:id],
            :first_name => person[:first_name],
            :last_name => person[:last_name],
            :title => employment[:title]
          }

          employees << titled_person
        end
      end
    end

    employees
  end

  def company_list_with_employees
    new_companies = Array.new

    @crm_data[:companies].each do |company|
      new_company = {
        name: company[:name],
        employees: employees_for_company(company[:id])
      }
      new_companies << new_company
    end
    new_companies
  end
end