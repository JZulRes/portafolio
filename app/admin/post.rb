ActiveAdmin.register Post do
  permit_params :title, :body, :image

  show do |_t|
    attributes_table do
      row :title
      row :body
      row :image do
        post.image? ? image_tag(post.image.url, height: '100') : content_tag(:span, 'Ninguna foto seleccionada')
      end
    end
  end

  form html: { enctype: 'multipart/form-data' } do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :image, hint: f.post.image? ? image_tag(post.image.url, height: '100') : content_tag(:span, 'Carga imagenes JPG/PNG/GIF')
    end
    f.actions
  end
end
