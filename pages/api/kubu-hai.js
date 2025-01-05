import { Configuration, OpenAIApi } from 'openai';

const configuration = new Configuration({
  apiKey: process.env.AIzaSyCHjfdo3w16ODd5yTVJD4o9pWmigOJEg,
});

const openai = new OpenAIApi(configuration);

export default async function handler(req, res) {
  const { prompt } = req.body;

  if (!prompt) {
    return res.status(400).json({ error: 'Prompt is required' });
  }

  try {
    const response = await openai.createCompletion({
      model: 'text-davinci-003',
      prompt,
      max_tokens: 150,
    });

    res.status(200).json({ response: response.data.choices[0].text });
  } catch (error) {
    res.status(500).json({ error: 'Error generating response' });
  }
}
