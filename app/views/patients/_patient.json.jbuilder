json.extract! patient, :id, :email, :password_digest, :name, :admin, :created_at, :updated_at
json.url patient_url(patient, format: :json)