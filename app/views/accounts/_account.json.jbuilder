json.extract! account, :id, :name, :bank_name, :branch_name, :description, :created_at, :updated_at
json.url account_url(account, format: :json)
