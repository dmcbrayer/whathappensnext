FactoryGirl.define do
  factory :story do
    user
    title "Grey Arrow"
    description "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris laoreet dui non erat porttitor dignissim. Morbi id lorem nisi. Donec ultricies elit nunc, eget rhoncus risus fringilla vitae. Quisque volutpat, enim scelerisque placerat consequat, felis libero tincidunt lacus, non malesuada ipsum felis nec libero. Mauris ac dolor elementum, iaculis risus quis, porta nisl. Donec in dui in ex dictum volutpat. Sed sit amet scelerisque tellus. Sed aliquam erat id tellus malesuada malesuada. Sed eget vulputate purus. Maecenas auctor, enim id gravida imperdiet, nisi turpis dignissim tellus, eu pulvinar ipsum dui in sapien."

    factory :invalid_story do
      title nil
    end
  end

end
