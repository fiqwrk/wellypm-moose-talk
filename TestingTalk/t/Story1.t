use Test::More;
use Test::Routine;
use Test::Routine::Util;
use Person;
use Cat;

test 'A cat owner is happy' => sub {
  my $cat = Cat->new( name=>'Tiddles' );
  my $person = Person->new( name=>'Fred', cats=>[ $cat ] );
  ok( $person->owns_cat );
  ok( $person->is_happy );
};

test 'A non-cat owner is unhappy' => sub {
  my $person = Person->new( name=>'Fred' );
  ok( ! $person->owns_cat );
  ok( ! $person->is_happy );
};

run_me;
done_testing;
