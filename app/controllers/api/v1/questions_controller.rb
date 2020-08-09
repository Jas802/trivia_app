module Api
    module v1
        class QuestionsController < ApplicationController
            def index
                questions = Question.all
                render json: {status: 'SUCCESS', message:'Loaded questions', data: qestions}, status: ok
            end

            


        end
    end
end