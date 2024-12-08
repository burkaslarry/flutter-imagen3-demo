import {genkit, z} from "genkit";
import {vertexAI} from "@genkit-ai/vertexai";
import {logger} from "genkit/logging";

const ai = genkit({ plugins: [vertexAI()] })
logger.setLogLevel("debug")

export const generateImageFlow = ai.defineFlow(
  {
    name: "generateImage",
    inputSchema: z.object({
      imageDescription: z.string(),
    }),
  },
  async (input) => {
    const prompt = `You are the best Japanese manga artist in the world. 
      Please generate an image of ${input.imageDescription}.`;
      
    const response = await ai.generate({
      model: `vertexai/imagen3`,
      prompt: prompt,
      config: {
        temperature: 0.7,
      },
      output: {
        format: `media`,
      },
    });

    console.log('Response:', response); 
    return response.media;
  }
)

ai.startFlowServer({ 
  flows: [generateImageFlow],
  cors: {
    origin: true
  }
})