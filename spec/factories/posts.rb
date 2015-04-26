FactoryGirl.define do
  factory :post do
    story
    body "When my love swears that she is made of truth,
      I do believe her, though I know she lies,
      That she might think me some untutored youth,
      Unlearnèd in the world’s false subtleties.
      Thus vainly thinking that she thinks me young,
      Although she knows my days are past the best,
      Simply I credit her false-speaking tongue:
      On both sides thus is simple truth suppressed.
      But wherefore says she not she is unjust?
      And wherefore say not I that I am old?
      Oh, love’s best habit is in seeming trust,
      And age in love loves not to have years told.
          Therefore I lie with her and she with me,
          And in our faults by lies we flattered be."

    factory :invalid_post do
      body nil
    end
  end

end
