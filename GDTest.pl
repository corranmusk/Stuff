#!/usr/bin/perl
# Demonstrate use of GD module to draw graphs using code from help file mainly
# Corran Musk 2012-04-07
# Uses code from GD POD

use GD::Graph::points;

@data = ( 
	["1st","2nd","3rd","4th","5th","6th","7th", "8th", "9th"],
	[    1,    2,    5,    6,    3,  1.5,    1,     3,     4],
	[ sort { $a <=> $b } (1, 2, 5, 6, 3, 1.5, 1, 3, 4) ]
);

my $graph = GD::Graph::points->new(400, 300);

$graph->set( 
	x_label           => 'X Label',
	y_label           => 'Y label',
	title             => 'Some simple graph',
	y_max_value       => 8,
	y_tick_number     => 8,
	y_label_skip      => 2 
) or die $graph->error;

my $gd = $graph->plot(\@data) or die $graph->error;
 
open(IMG, '>file.png') or die $!;
binmode IMG;
print IMG $gd->png;
