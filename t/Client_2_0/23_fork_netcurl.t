use lib 't/lib';

$ENV{ES_VERSION} = '2_0';
$ENV{ES_CXN} = 'NetCurl';
do "es_sync_fork.pl" or die( $@ || $! );

