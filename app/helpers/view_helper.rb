module ViewHelper
    module NavbarHelper
        def show_profile_element(user)
            content_tag(:ul, class: "navbar-nav ms-auto mb-2 mb-lg-0 navbar-nav-scroll") do 
                concat(
                    content_tag(:li, class: "nav-item dropdown") do 
                        concat(link_to(
                            user.full_name, 
                            "#", 
                            id: "nav-1-toggler", 
                            class: "nav-link dropdown-toggle", 
                            role: "button",
                            aria: { expanded: "false" },
                            data: { bs_toggle: "dropdown" }
                            )
                        )
                        concat(
                            content_tag(:ul, class: "dropdown-menu dropdown-menu-end", aria: { labelledby: "nav-1-toggler" }) do
                                concat(
                                    content_tag(:li) do 
                                        concat(link_to("Profil", "#", class: "dropdown-item"))
                                        concat(link_to("Logout", logout_path, method: :delete, class: "dropdown-item dropdown-logout"))
                                    end
                                )
                            end
                        )
                    end
                )
            end
        end
    end
end