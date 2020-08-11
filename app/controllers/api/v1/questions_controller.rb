module Api
    module V1
        class QuestionsController < ApplicationController
            def index
                questions = Question.all
                render json: {status: 'SUCCESS', message:'Loaded questions', data: questions},status: :ok
            end

            def show
                question = Question.find(params[:id])
                render json: {status: 'SUCCESS', message:'Loaded question', data: question},status: :ok
            end

            def create
                question = Question.new(question_params)
                
                if question.save
                    render json: {status: 'SUCCESS', message:'Saved question', data: question},status: :ok
                else
                    render json: {status: 'ERROR', message:'Question not saved',
                    data: question.errors},status: :unprocessable_entity
                end
            end

            def update
                question = Question.find(params[:id])

                if question.update(question_params)
                    render json: {status: 'SUCCESS', message:'Updated question', data: question},status: :ok
                else
                    render json: {status: 'ERROR', message:'Question not updated',
                    data: question.errors},status: :unprocessable_entity
                end
            end

            def destroy
                question = Question.find(params[:id])
                question.destroy

                render json: {status: 'SUCCESS', message:'Deleted question', data: question},status: :ok
            end




            private

            def question_params
                params.permit(:title)
            end
        end
    end
end