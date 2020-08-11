module Api
    module V1
        class AnswersController < ApplicationController
            def index
                answers = Answer.all
                render json: {status: 'SUCCESS', message:'Loaded answers', data: answers},status: :ok
            end

            def show
                answer = Answer.find(params[:id])
                render json: {status: 'SUCCESS', message:'Loaded answer', data: answer},status: :ok
            end

            def create
                answer = Answer.new(answer_params)
                
                if answer.save
                    render json: {status: 'SUCCESS', message:'Saved answer', data: answer},status: :ok
                else
                    render json: {status: 'ERROR', message:'Answer not saved',
                    data: answer.errors},status: :unprocessable_entity
                end
            end

            def update
                answer = Answer.find(params[:id])

                if answer.update(answer_params)
                    render json: {status: 'SUCCESS', message:'Updated answer', data: answer},status: :ok
                else
                    render json: {status: 'ERROR', message:'Answer not updated',
                    data: answer.errors},status: :unprocessable_entity
                end
            end

            def destroy
                answer = Answer.find(params[:id])
                answer.destroy

                render json: {status: 'SUCCESS', message:'Deleted answer', data: answer},status: :ok
            end

            private

            def answer_params
                params.permit(:response, :question_id)
            end
        end
    end
end