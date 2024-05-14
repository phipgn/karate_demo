function fn() {
    const env = karate.env;
    const config = {
        baseUrl: '',
        utilPaths: {
            random: 'classpath:utils/random.feature'
        }
    };

    return config;
}