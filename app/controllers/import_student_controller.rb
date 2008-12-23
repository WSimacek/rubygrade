require 'fastercsv'

class ImportStudentController < ApplicationController

    def index
    end

    def csv_import
      file = params[:csv_import][:file]
      logcount=0
      Student.transaction do
        FasterCSV.parse(file, :headers => true) do |row|
          Student.create!(row.to_hash)
          logcount += 1
        end
      end
      flash[:notice] = "Successfully added #{logcount} Student(s)."
      redirect_to :action => :index
    rescue => exception
      # If an exception is thrown, the transaction rolls back and we end up in this rescue block
      error = ERB::Util.h(exception.to_s) # get the error and HTML escape it
      flash[:error] = "Error adding logs.  (#{error}).  Please try again."
      redirect_to :action => :index
    end

  end

