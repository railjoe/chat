class Message < ActiveRecord::Base
  belongs_to Chat.klass_1.to_sym unless only_one_model?
  belongs_to Chat.klass_2.to_sym unless only_one_model?
  belongs_to "#{Chat.klass_2}_1".to_sym, class_name: Chat.user_1_class if only_one_model?
  belongs_to "#{Chat.klass_2}_2".to_sym, class_name: Chat.user_1_class if only_one_model?
  belongs_to :conversation
end
