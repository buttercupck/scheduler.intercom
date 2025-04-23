import { createClient } from '@supabase/supabase-js'
import InterpreterProfile from './interpreterProfile'

const supabase = createClient(
  import.meta.env.VITE_SUPABASE_URL,
  import.meta.env.VITE_SUPABASE_ANON_KEY
)

function App() {
  return (
    <div style={{ padding: '2rem' }}>
      <h1>Interpreter Scheduler</h1>
      <InterpreterProfile />
    </div>
  );
}

export default App;