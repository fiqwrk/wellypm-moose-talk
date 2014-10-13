use Test::More;
use Test::Routine;
use Test::Routine::Util;

before 'run_test' => sub {
       my $self = shift;
       $self->owner->set_cats([ $self->cat ]);
};

test 'When moggy is happy, fred is happy and vice-versa' => sub {
  my $self = shift;
  is( !$self->cat->is_grumpy, $self->owner->is_happy );
};

run_tests('Test with happy cats and alergic owners',  ['main', 'HappyCat', 'AllergicOwner']);
run_tests('Test with happy cats and healthy owners',  ['main', 'HappyCat', 'HealthyOwner']);
run_tests('Test with grump cats and allergic owners', ['main', 'GrumpyCat', 'AllergicOwner']);
run_tests('Test with grump cats and healthy owners',  ['main', 'GrumpyCat', 'HealthyOwner']);
done_testing;
