class ActivitiesController < ApplicationController
    def show 
        @trip = Trip.find(params[:trip_id].to_i)
        @user = @trip.user
        @activity = Activity.find(params[:id].to_i)
        
        # @likes = @activity.likes_count
        # @dislikes = @activity.dislikes_count
    end 

    def index 
        @activities = Activity.all
    end

    def addactivities
        # if destination == 'destination'
        #     if action == 'add'
        #         @iter[destination] = []    
        #     else
        #         @iter.delete(destination)
        #     end 
        # end
        # else 
        #     if action == 'add' 
        #         iter['activities'] = []
        #         iter['activities'] << activity 
        #     else
        #         iter['acti']
        #     end 
        # end
        @trip = Trip.find(params[:trip].to_i)
        @activity = Activity.find(params[:activity].to_i)
        @user = @trip.user
        if @trip.activities == nil 
            # @trip.activities == @activity.name
            # @trip.save
            @trip.update_attribute(:activities, @activity.id.to_s)
        else
            @activities = @trip.activities + " " + @activity.id.to_s
            @trip.update_attribute(:activities, @activities )
        end
        redirect_to user_trip_path(user_id: @user.id, id: @trip.id)
    end
end


