//npm i openai@3.1.0    
const {Configuration, OpenAIApi} = require("openai");
const config = new Configuration({
    apiKey: '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'
});
const openai = new OpenAIApi(config);
const runPrompt = async () => {

    const prompt = `
    write me a grocerry ingredients for diahria inside a java script list in the following JSON formet:
    {
        "Q":"question",
        "A":"answer",
    }`;

    const response = await openai.createCompletion({
        model:"text-davinci-003",
        prompt:prompt,
        max_tokens:2048,
        temperature:1,
    });

    const parsableJSONresponse = response.data.choices[0].text;
    const parsedResponse = JSON.parse(parsableJSONresponse);

   // console.log(parsedResponse.Q);
    console.log(parsedResponse.A);

}

runPrompt();