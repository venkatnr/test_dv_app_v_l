class IterationsController < ApplicationController
before_filter :test, :except => [:index, :new, :edit]

def test
		@project = Project.find(params[:project_id])
		
		@iteration = @project.iteration.find(params[:id])
		
		@endtime =  @iteration.end_date-Time.now.to_date
		if @endtime.to_i == -1
			@iteration.update_attributes(:status => "Closed")
			project_iterations_path(@project.id)
		 else
			project_iteration_path(@project.id, @iteration.id)
		 end
end

def index
    @project = Project.find(params[:project_id])
    @iterations = Iteration.find(:all)
end

def new
    @project = Project.find(params[:project_id])
    @iteration = @project.iteration.new
	 
end

def edit
    @project = Project.find(params[:project_id])
    @iteration = @project.iteration.find(params[:id])
end

def create
    @project = Project.find(params[:project_id])
    @iteration = @project.iteration.create(params[:iteration])
    redirect_to project_iteration_path(@project.id, @iteration.id )
end

def update
   @project = Project.find(params[:project_id])
   @iteration = @project.iteration.find(params[:id])
   if @iteration.update_attributes(params[:iteration])
       render :action => "show"
   else
       render :action => "edit"
   end
 end

def show
    @project = Project.find(params[:project_id])
    @iteration = @project.iteration.find(params[:id])
    render :action => "show"
end
end
