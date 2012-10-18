class EventsUsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  # GET /events_users
  # GET /events_users.json
  def index
    @events_users = EventsUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events_users }
    end
  end

  # GET /events_users/1
  # GET /events_users/1.json
  def show
    @events_user = EventsUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @events_user }
    end
  end

  # GET /events_users/new
  # GET /events_users/new.json
  def new
    event_id = Integer(params[:event_id]) rescue 0
    if event_id < 1
        redirect_to root_path
    elsif EventsUser.where(:event_id => event_id, :user_id => current_user.id).count > 0
      @events_user = EventsUser.where(:event_id => event_id, :user_id => current_user.id).first
      redirect_to edit_events_user_path(:id => @events_user.id)
    else
      @events_user = EventsUser.new
      @events_user.event_id = event_id
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @events_user }
      end
    end
  end

  # GET /events_users/1/edit
  def edit
    id = Integer(params[:id]) rescue 0
    if id < 1
        redirect_to root_path
    elsif EventsUser.where(:id => params[:id]).count > 0
      @events_user = EventsUser.find(params[:id])
      if @events_user.user_id != current_user.id
        redirect_to new_events_user_path(:id => @events_user.id)
      end
    else
        redirect_to root_path
    end
  end

  # POST /events_users
  # POST /events_users.json
  def create
    @events_user = EventsUser.new(params[:events_user])
    if EventsUser.where(:event_id => @events_user.event_id, :user_id => current_user.id).count > 0
      @events_user = EventsUser.where(:event_id => @events_user.event_id, :user_id => current_user.id).first
      redirect_to edit_events_user_path(:id => @events_user.id)
    else
      @events_user.user_id = current_user.id
      respond_to do |format|
        if @events_user.save
          confirmation_message = (@events_user.attending) ? "Thanks for confirming your attendance! Your response was saved." : "Sorry you can't make it. Your response was saved."
          format.html { redirect_to root_path, notice: confirmation_message }
          format.json { render json: @events_user, status: :created, location: @events_user }
        else
          format.html { render action: "new" }
          format.json { render json: @events_user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /events_users/1
  # PUT /events_users/1.json
  def update
    @events_user = EventsUser.find(params[:id])
    @events_user.user_id = current_user.id

    respond_to do |format|
      if @events_user.update_attributes(params[:events_user])
        confirmation_message = (@events_user.attending) ? "Thanks for confirming your attendance! Your response was saved." : "Sorry you can't make it. Your response was saved."
        format.html { redirect_to root_path, notice: confirmation_message }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @events_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events_users/1
  # DELETE /events_users/1.json
  def destroy
    @events_user = EventsUser.find(params[:id])
    @events_user.destroy

    respond_to do |format|
      format.html { redirect_to events_users_url }
      format.json { head :no_content }
    end
  end
end
