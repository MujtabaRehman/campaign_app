class Expert < User
    validates :profession, presence: true, length: { minimum: 3 }, format: {with: /[a-zA-Z]/}
    validates :service, presence: true, length: { minimum: 3 }, format: {with: /[a-zA-Z]/}

    has_many :campaigns, foreign_key: :user_id, dependent: :destroy
end
