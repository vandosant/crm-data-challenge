require 'spec_helper'
require_relative '../data_manager'

describe DataManager do
  before do
    data = {
      :people => [
        {
          :id => 1,
          :first_name => "Whitmer",
          :last_name => "Jackson",
          :employments =>
            [
              {
                :company_id => 2,
                :title => "Technology Manager"
              }
            ]
        },
        {
          :id => 2,
          :first_name => "Stewart",
          :last_name => "Lipton",
          :employments =>
            [
              {
                :company_id => 1,
                :title => "Quality Control Engineer"
              }
            ]
        },
        {
          :id => 3,
          :first_name => "Angela",
          :last_name => "Swanson",
          :employments =>
            [
              {
                :company_id => 1,
                :title => "Stunt Person"
              }
            ]
        }
      ],
      :companies => [
        {
          :id => 0,
          :name => "Buick"
        },
        {
          :id => 1,
          :name => "Tesla"
        },
        {
          :id => 2,
          :name => "Toyota"
        }
      ]
    }

    @data_map = DataManager.new(data)
  end

  it 'can find people who work for a specific company' do
    actual_employees = @data_map.employees_for_company(2)
    expected_employees = [
      {
        :id => 1,
        :first_name => "Whitmer",
        :last_name => "Jackson",
        :title => "Technology Manager"
      }
    ]
    expect(actual_employees).to match_array(expected_employees)
  end

  it 'can list the employees for each company' do
    actual = @data_map.company_list_with_employees
    expected = [
      {
        name: "Buick",
        employees: []
      },
      {
        name: "Tesla",
        employees: [
          {
            :id => 2,
            :first_name => "Stewart",
            :last_name => "Lipton",
            :title => "Quality Control Engineer"
          },
          {
            :id => 3,
            :first_name => "Angela",
            :last_name => "Swanson",
            :title => "Stunt Person"
          },
        ]
      },
      {
        name: "Toyota",
        employees: [
          {
            :id => 1,
            :first_name => "Whitmer",
            :last_name => "Jackson",
            :title => "Technology Manager"
          }
        ]
      }

    ]

    expect(actual).to match_array(expected)
  end
end