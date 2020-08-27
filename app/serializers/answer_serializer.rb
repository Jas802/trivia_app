class AnswerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :response, :question_id
  belongs_to :question
end
