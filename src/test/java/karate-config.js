function fn() {
    const env = karate.env;
    const config = {
        baseUrl: 'https://service-mesh-ingress-uat.fundingasiagroup.com/neobank-partner-integration-service/v1',
        utilPaths: {
            random: 'classpath:utils/random.feature'
        }
    };

    if (env !== 'uat' && env !== 'stg') {
        throw new Error('Env not supported');
    }

    return config;
}