ActiveAdmin.register Import do
  permit_params :file, :file_name
  # ====================Actions=========================================================================================
  index download_links: false do
    column :file_name
    actions defaults: false do |import|
      item "Edit", edit_admin_import_path(import), prirority: 1
      item "Destroy", admin_import_path(import),
           method: :delete,
           data: {confirm: 'Are you sure to delete?'},
           prirority: 2
    end
  end

  show do
    attributes_table do
      row :file_name
    end
  end
  # ====================Form============================================================================================
  form do |form|
    form.inputs do
      form.input :file_name
      form.input :file, required: true, as: :file
    end
    form.actions
  end
  # ====================Controller======================================================================================
  controller do

    def new
      @import = Import.new
    end

    def create
      @import = Import.new(permit_params)
      if @import.save
        redirect_to admin_import_path(@import)
      else
        flash[:warning] = "File must have a user"
        render :new
      end
    end

    private

    def permit_params
      params.require(:import).permit(:file, :file_name)
    end
  end
end
