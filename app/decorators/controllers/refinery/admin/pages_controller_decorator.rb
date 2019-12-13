if Refinery::PageResources.config.enabled_models.include? "Refinery::Page"

    Refinery::Admin::PagesController.prepend(
	  Module.new do
	    def permitted_page_params
	        params[:page][:resources_attributes]={} if params[:page][:resources_attributes].nil?
	        super <<  [resources_attributes: [:id, :page_resource_id]]
	      
	    end
	  end
	)
end