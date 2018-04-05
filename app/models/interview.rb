class Interview < ApplicationRecord
  belongs_to :user

  enum interview_status: { pending:0, approval:1, refusal:2 }
end
