json.extract! cv, :id, :user_id, :first_name, :middle_name, :last_name, :age, :height, :weight, :marital_status, :children, :phone_number, :current_address_L1, :current_address_L2, :current_city, :current_country, :skills, :work_visa, :visa_exp_date, :nationality, :created_at, :updated_at
json.url cv_url(cv, format: :json)
