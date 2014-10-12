use Test::More;
use Test::Routine;
use Test::Routine::Util;
use Cat;

test 'A cat can be grumpy' => sub {
  my $cat = Cat->new( name=>'Moggy', grumpy=> 1 );
  ok( $cat->is_grumpy );
};

test 'A non-grumpy cat can exist' => sub {
  my $cat = Cat->new( name=>'Moggy' );
  ok( ! $cat->is_grumpy );
};

run_me;
done_testing;
