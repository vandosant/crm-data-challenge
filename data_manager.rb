class DataManager
  def initialize(crm_data)
    @crm_data = crm_data
  end

  def employees_for_company(company_id)
    employees = Array.new
    @crm_data[:people].each do |person|
      person[:employments].each do |employment|
        if employment[:company_id] == company_id
          employees << person
        end
      end
    end

    employees
  end
end