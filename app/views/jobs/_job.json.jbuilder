json.extract! job, :id, :title, :body, :open, :closed_date, :created_at, :updated_at
json.url job_url(job, format: :json)