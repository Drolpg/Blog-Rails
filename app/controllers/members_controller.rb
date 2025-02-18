class MembersController < ApplicationController
before_action :fetch_member, only: [:show, :edit, :update, :destroy]

    def index
       @members = Member.all.order(created_at: :asc)
    end

    def new 
        @member = Member.new
    end

    def create 
        @member = Member.new(member_params)

        return redirect_to members_path(@member) if @member.save

        render :new

        # if @member.save
        #     redirect_to members_path(@member)

        #     else
        #         render :new
        #     end
    end

    def edit; end
    

    def update 

        return redirect_to members_path(@member) if @member.update(member_params)

        render :edit

        # if @member.update(member_params)
        #     redirect_to members_path(@member)

        #     else
        #         render :edit
        #     end
    end

    def show; end

    def destroy
        @member.destroy
        redirect_to members_path, notice: "Member deleted successfully."
    end


    private
    def member_params
        params.require(:member).permit(:name, :age, :number)
    end

    def fetch_member
        @member = Member.find(params[:id])
    end
end
