class Interview < ApplicationRecord
  belongs_to :user

  enum interview_status: { on_hold:0, approval:1, refusal:2 }
end
