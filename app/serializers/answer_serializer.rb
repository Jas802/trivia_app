class AnswerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :response, :question_id, :correct_answer
  belongs_to :question
end
