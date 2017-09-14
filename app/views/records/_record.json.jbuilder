json.extract! record, :id, :uploader, :created_at, :updated_at
json.url record_url(record, format: :json)
