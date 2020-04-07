import org.tensorflow.lite.Interpreter;
import org.tensorflow.lite.gpu.GpuDelegate;

// Initialize interpreter with GPU delegate
GpuDelegate delegate = new GpuDelegate();
Interpreter.Options options = (new Interpreter.Options()).addDelegate(delegate);
Interpreter interpreter = new Interpreter(model, options);

// Run inference
while (true) {
  writeToInput(input);
  interpreter.run(input, output);
  readFromOutput(output);
}

// Clean up
delegate.close();

