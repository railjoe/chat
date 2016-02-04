module Chat
  class Engine < ::Rails::Engine
    isolate_namespace Chat

    initializer "chat.load_classes" do
      Chat.only_one_model = Chat.user_2_class.nil?
      if Chat.only_one_model
        Chat.klass_1 = "#{Chat.user_1_class.downcase}"
        Chat.klass_2 = "#{Chat.user_1_class.downcase}"
      else
        Chat.klass_1 = "#{Chat.user_1_class.downcase}"
        Chat.klass_2 = "#{Chat.user_2_class.downcase}"
      end
    end
  end
end
