const Redis = require('ioredis');

const redis = new Redis({
    host: process.env.REDIS_HOST,
    port: process.env.REDIS_PORT,
});

redis.on('connect', () => {
    console.log('[Redis] Connected successfully.');
});

redis.on('error', (err) => {
    console.error('[Redis Error] Connection failed:', err.message);
});

module.exports = redis;