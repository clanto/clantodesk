<?php
// ClantoDesk update endpoint (static control)
header('Content-Type: application/json');

// Client sends POST JSON; we accept it even if unused
$raw = file_get_contents('php://input');
$request = json_decode($raw, true);

$UPDATE_ENABLED = true; // true = allow updates, false = block updates
$LATEST_TAG = '1.4.6'; // e.g. 1.4.5, 1.4.6

if (!$UPDATE_ENABLED) {
    // Return a non-upgrade version to prevent updates
    echo json_encode([
        'url' => 'https://github.com/clanto/clantodesk/releases/tag/0.0.0',
    ]);
    exit;
}

echo json_encode([
    'url' => "https://github.com/clanto/clantodesk/releases/tag/{$LATEST_TAG}",
]);
