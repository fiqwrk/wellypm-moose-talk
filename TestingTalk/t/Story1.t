use Test::More;
use Test::Routine;
use Test::Routine::Util;
use Person;

test 'A cat owner is happy' => sub {
  my $person = new Person( name=>'Fred', cats=>1 );
  ok( $person->owns_cat );
  ok( $person->is_happy );
};

test 'A non-cat owner is unhappy' => sub {
  my $person = new Person( name=>'Fred' );
  ok( ! $person->owns_cat );
  ok( ! $person->is_happy );
};

run_me;
done_testing;
