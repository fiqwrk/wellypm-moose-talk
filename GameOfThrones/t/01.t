use Test::More;
use TVShow;
use WWW::EZTV;

my $got = TVShow->new({
  title => 'Game Of Thrones'
});

isa_ok( $got, 'TVShow' );

cmp_ok(
  $got->get_episodes->has_links->size,
  '>', 10,
  'Got > 10 episodes' );

done_testing; 



