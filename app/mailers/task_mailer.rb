class TaskMailer < ActionMailer::Base
  default from: "redmine.logicmatter@gmail.com"
def task_creation(usermail,iname,tid)
@task_acceptor = usermail
@pro_name = iname
@task_name = tid
@task = Task.find(:all , :conditions => {:id => @task_name })

    mail(:to =>@task_acceptor.mail, :subject => "Task", :from => "redmine.logicmatter@gmail.com")
  end

def task_update(usermail,tid,week)
@task_acceptor = usermail
@task = tid
@week = week
@task = Task.find(:all , :conditions => {:id => @task })
@tasks = Task.find(:all)

    mail(:to =>@task_acceptor.mail, :subject => "Task", :from => "redmine.logicmatter@gmail.com")
  end  
def weekly_mail(usermail)
@task_acceptor = usermail.mail

   mail(:to => @task_acceptor, :subject => "Task", :from => "redmine.logicmatter@gmail.com")
end
def checkmail
  mail(:to =>"sriram.in20@gmail.com", :subject => "Task", :from => "redmine.logicmatter@gmail.com")
end
end



#@sendmail = TaskMailer.new
#@sendmail.checkmail
