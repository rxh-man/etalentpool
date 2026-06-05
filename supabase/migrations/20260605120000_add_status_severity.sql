ALTER TABLE public.transformation_plan
  ADD COLUMN IF NOT EXISTS status text NOT NULL DEFAULT 'pending',
  ADD COLUMN IF NOT EXISTS severity text NOT NULL DEFAULT 'medium';
