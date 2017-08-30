class DiaryController < ApplicationController
    before_filter :authenticate_user!
    
    def index
        @d = Diary.all
    end
    def d_write
      diaries = Diary.new(content: params[:content],
                          user: current_user)
      diaries.save
      redirect_to '/diary/index'
    end
    def dView
        @diary = Diary.find(params[:diary_id])
    end
    def commentWrite
        comment = Comment.new(content: params[:name_comment],
                              user: current_user,
                              diary_id: params[:diary_id])
        comment.save
        redirect_to "/diary/dView/#{params[:diary_id]}"
    end
    def commentDelete
         comment = Comment.find(params[:comment_id])
        comment.destroy
    redirect_to "/diary/dView/#{params[:diary_id]}"
    end
    def dDelete
        diary = Diary.find(params[:diary_id])
        diary.destroy
        redirect_to '/diary/index'
    end
    def commentUpdate
        comment = Comment.find(params[:comment_id])
        comment.content = params[:comment]
        comment.save
        redirect_to "/diary/dView/#{params[:diary_id]}"
    end
end
