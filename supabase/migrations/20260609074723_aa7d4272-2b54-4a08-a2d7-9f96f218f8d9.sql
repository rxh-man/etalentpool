CREATE TABLE public.governance_state (
  key text PRIMARY KEY,
  data jsonb NOT NULL DEFAULT '{}'::jsonb,
  updated_at timestamptz NOT NULL DEFAULT now()
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.governance_state TO anon, authenticated;
GRANT ALL ON public.governance_state TO service_role;
ALTER TABLE public.governance_state ENABLE ROW LEVEL SECURITY;
CREATE POLICY "public read governance_state" ON public.governance_state FOR SELECT USING (true);
CREATE POLICY "public insert governance_state" ON public.governance_state FOR INSERT WITH CHECK (true);
CREATE POLICY "public update governance_state" ON public.governance_state FOR UPDATE USING (true) WITH CHECK (true);
INSERT INTO public.governance_state(key,data) VALUES ('governance', '{"poolTotal":0,"projects":{},"updatedAt":null}'::jsonb) ON CONFLICT DO NOTHING;