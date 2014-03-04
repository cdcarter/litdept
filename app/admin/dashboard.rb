ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do


    columns do
      column do
        panel "Must-Read Plays" do
          scripts = Script.where(must_read: true)
          if scripts.empty?
            para 'No scripts are currently marked "must read."'
          else
            ul do
              scripts.each do |script|
                li link_to(script.title, script_path(script))
              end
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to the Seattle Repertory Theatre Literary Database. "
        end
      end
    end
  end # content
end