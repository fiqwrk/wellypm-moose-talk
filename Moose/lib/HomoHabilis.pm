use Moops;
use Ape;

class HomoHabilis  {
  has 'grunt' => (
	is => 'rw',
	isa => 'Bool',
	predicate => 'can_grunt',
  );

  # private
  has 'rage' => ( is => 'rwp', isa => 'Bool', default=>1 );
  has 'xp' => ( is => 'rwp', isa => 'Int', default=>100 );

  method adjust_xp( Int $value ) {
    $self->set_xp( $self->xp + $value );
  } 

  method hit_noisy_ape( Ape $target  where {$_->can_grunt} ) {
    if ($self->get_rate) {
      $target->adjust_xp( -10 );
      $self->adjust_xp( +10 );
    }
  }  
}

