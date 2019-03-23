json.extract! history, :id, :transaction_history, :description, :created_at, :updated_at
json.url history_url(history, format: :json)
