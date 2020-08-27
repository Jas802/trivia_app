class QuestionSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :title
  has_many :answers
end
